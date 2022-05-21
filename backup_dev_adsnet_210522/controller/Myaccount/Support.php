<?php

namespace Controller\Myaccount;

class Support extends Controller
{
    public $enable404 = false;
    public $services = ['Global', 'Advertiser', 'Publisher'];
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Support;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Opening', 'Replied', 'Closed'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countTicket($user_id);
            } else {
                $this->data->total = $db->countTicketSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countTicketType($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countTicketTypeSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listTicket($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listTicketSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listTicketType($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listTicketTypeSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My Support Tickets - '.SITE_NAME;
        $this->view = 'Myaccount/support/index';
        $this->renderView();
    }
    
    public function create()
    {
        $this->title = 'Create Ticket - '.SITE_NAME;
        $this->view = 'Myaccount/support/create';
        $this->renderView();
    }
    
    public function __postCreate()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $service = $this->postRequest('service');
        $subject = trim($this->postRequest('subject'));
        $message = trim($this->postRequest('message'));
        if(!$subject || strlen($subject) < 10 || !$message || strlen($message) < 10 || !in_array($service, $this->services)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Myaccount\Support;
        $user_id = $this->getSession('id');
        $ticket_id = $db->createTicket($user_id, $service, $subject, 'Opening');
        $db->createMessage($user_id, $ticket_id, $message);
        
        /* email to support staff */
        $role = 'canAssign'.$service.'Ticket';
        $permissions = \Controller\Admin\Roles::$role();
        if($permissions) {
            $admins = $db->listAdminByPermission($permissions);
            if($admins) {
                $emails = [];
                foreach($admins as $admin) $emails[] = $admin->email;
                $message .= PHP_EOL.PHP_EOL.'#######################'.PHP_EOL.'Do not reply this email, go here instead: '.ADMIN_URL.'/support/ticket/'.$ticket_id;
                (new \Module\Email)
                    ->subject('[Ticket #'.$ticket_id.'] '.$subject)
                    ->message(nl2br($message))
                    ->sendTo($emails)
                    ->send();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function ticket()
    {
        if (!($id = (int) $this->uri[2])) {
            $this->redirectTo('/support');
        }
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Support;

        if (!($this->data->ticket = $db->getTicket($user_id, $id))) {
            $this->redirectTo('/support');
        }
        $this->data->avatar = 'https://www.gravatar.com/avatar/'.md5(strtolower(trim($this->getSession('email'))));
        $this->data->name = $this->getSession('name');
        $this->data->message = $db->listMessage($id);

        $this->view = 'Myaccount/support/ticket';
        $this->title = 'Ticket #'.$this->data->ticket->id.' - '.SITE_NAME;
        $this->renderView();
    }
    
    public function __postReply()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        if (!($message = $this->postRequest('message')) || !($ticket_id = (int) $this->postRequest('ticket_id'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Support;
        
        if (!$db->updateTicketStatus($user_id, $ticket_id, 'Opening', date('Y-m-d G:i:s'))) {
            $this->data->data = 'Error! Ticket not found or not yours!';
            $this->renderView();
        }
        $db->createMessage($user_id, $ticket_id, $message);
        
        /* email to support staff */
        $ticket = $db->getTicket($user_id, $ticket_id);
        $role = 'canAssign'.$ticket->service.'Ticket';
        $permissions = \Controller\Admin\Roles::$role();
        if($permissions) {
            $admins = $db->listAdminByPermission($permissions);
            if($admins) {
                $emails = [];
                foreach($admins as $admin) $emails[] = $admin->email;
                $message .= PHP_EOL.PHP_EOL.'#######################'.PHP_EOL.'Do not reply this email, go here instead: '.ADMIN_URL.'/support/ticket/'.$ticket_id;
                (new \Module\Email)
                    ->subject('RE: [Ticket #'.$ticket_id.']')
                    ->message(nl2br($message))
                    ->sendTo($emails)
                    ->send();
            }
        }

        $this->data->success = true;
        $this->renderView();
    }

    public function __postClose()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        if (!($ticket_id = (int) $this->postRequest('ticket_id'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Support;
        if (!$db->updateTicketStatus($user_id, $ticket_id, 'Closed', date('Y-m-d G:i:s'))) {
            $this->data->data = 'Error! Ticket not found or not yours!';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
}
