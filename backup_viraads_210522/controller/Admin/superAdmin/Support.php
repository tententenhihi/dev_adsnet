<?php

namespace Controller\Admin\superAdmin;

class Support extends Controller
{
    public $enable404 = false;
    public $permissionRequired = ['support', 'system', 'superAdmin'];
    
    public function index()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Opening', 'Replied', 'Closed'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = ucwords($this->uri[1]);
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Support;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countTicketByUser($user_id);
                } else {
                    $this->data->total = $db->countTicketSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countTicketTypeByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countTicketTypeSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countTicket();
                } else {
                    $this->data->total = $db->countTicketSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countTicketType($this->data->status);
                } else {
                    $this->data->total = $db->countTicketTypeSearch($this->data->status, $this->data->key);
                }
            }
        }
        

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listTicketByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listTicketSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listTicketTypeByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listTicketTypeSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listTicket($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listTicketSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listTicketType($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listTicketTypeSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Support - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Support - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/support/index';
        $this->renderView();
    }
    
    public function create()
    {
        $db = new \Model\Admin\superAdmin\Support;
        $this->data->user_id = $this->getRequest('user_id');
        $this->view = 'Admin/superAdmin/support/create';
        $this->title = 'Create new Ticket - Admin '.SITE_NAME;
        $this->renderView();
    }
    
    public function ticket()
    {
        if (!($id = (int) $this->uri[2])) {
            $this->redirectTo('/support');
        }
        $db = new \Model\Admin\superAdmin\Support;

        if (!($this->data->ticket = $db->getTicket($id))) {
            $this->redirectTo('/support');
        }
        $this->data->user = $db->getUserAndBalance($this->data->ticket->user_id);
        $this->data->user->avatar = 'https://www.gravatar.com/avatar/'.md5(strtolower(trim($this->data->user->email)));
        $this->data->message = $db->listMessage($id);

        $this->view = 'Admin/superAdmin/support/ticket';
        $this->title = 'Ticket #'.$this->data->ticket->id.' - Admin '.SITE_NAME;
        $this->renderView();
    }
    
    public function __postCreate()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_ids = $this->postRequest('user_id');
        $service = $this->postRequest('service');
        $subject = $this->postRequest('subject');
        $message = $this->postRequest('message');
        if(!$user_ids || !$subject || strlen($subject) < 10 || !$message || strlen($message) < 10 || !in_array($service, ['advertiser', 'publisher', 'global'])) {
            $this->data->data = 'Bad request, invalid params';
            $this->renderView();
        }
        $user_ids = explode(",", $user_ids);
        
        $db = new \Model\Admin\superAdmin\Support;
        
        $success = [];
        foreach($user_ids as $user_id) {
            $id = (int) $user_id;
            if(!$id) continue;
            if(!($user = $db->getUser($id))) continue;
            $ticket_id = $db->createTicket($user->id, $service, $subject, 'Replied');
            $db->createMessage($ticket_id, $message);
            $success[] = $user->id;
            
            $email_message = $message.PHP_EOL.PHP_EOL.'#######################'.PHP_EOL.'Do not reply this email, go here instead: '.MYACCOUNT_URL.'/support/ticket/'.$ticket_id;
            
            (new \Module\Email)
                ->subject('[Ticket #'.$ticket_id.'] '.$subject)
                ->message(nl2br($email_message))
                ->sendTo($user->email)
                ->send();
        }
        
        if(!$success) {
            $this->data->data = 'Could not create any tickets, make sure User IDs are correct';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->data->data = 'created '.count($success).' ticket(s) for follow user ids: '.implode(', ',$success);
        $this->renderView();
    }
    
    public function __postTicket()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $ticket_id = (int) $this->postRequest('ticket_id');
        $message_id = (int) $this->postRequest('message_id');
        $message = $this->postRequest('message');
        $escalate = $this->postRequest('escalate');
        $remove = (int) $this->postRequest('remove');
        $db = new \Model\Admin\superAdmin\Support;
        
        $ticket = $db->getTicket($ticket_id);
        if (!$ticket) {
            $this->data->data = 'Ticket #'.$ticket_id.' not found';
            $this->renderView();
        }

        if($message_id) {
            $db->updateMessage($ticket->id, $message_id, $message);
        } elseif($message) {
            $db->updateTicketStatus($ticket->id, 'Replied', date('Y-m-d G:i:s'));
            $db->createMessage($ticket->id, $message);
            $user = $db->getUser($ticket->user_id);
            
            $message .= PHP_EOL.PHP_EOL.'#######################'.PHP_EOL.'Do not reply this email, go here instead: '.MYACCOUNT_URL.'/support/ticket/'.$ticket_id;
            (new \Module\Email)
                ->subject('[Ticket #'.$ticket->id.'] '.$ticket->subject)
                ->message(nl2br($message))
                ->sendTo($user->email)
                ->send();

        } elseif($escalate) {
            $db->updateTicketEscalate($ticket->id, date('Y-m-d G:i:s'));
            $message = 'Your ticket has been escalated to our senior staff, please hold on while they are reviewing it and will give you solutions shortly';
            $db->createMessage($ticket->id, $message);
        } elseif($remove) {
            $db->deleteMessage($ticket->id, $remove);
        } else {
            $db->updateTicketStatus($ticket_id, 'Closed', date('Y-m-d G:i:s'));
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    protected function numberFormat($number, $precision = 2, $suffixes = ['', 'K', 'M', 'B'], $n = 1000)
    {
        $number = (int) $number;
        if ($number < $n) {
            return $number.$suffixes[0];
        }
        $base = log($number, $n);

        return round(pow($n, $base - floor($base)), $precision).$suffixes[floor($base)];
    }
    
    protected function currencyFormat($n, $c = '$', $d = 3, $p = '.', $v = ',')
    {
        return $c.number_format($n, $d, $p, $v);
    }
}