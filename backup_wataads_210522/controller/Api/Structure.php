<?php

namespace Controller\Api;

class Structure extends Controller
{
    public function index()
    {
        $this->data = [
            'openapi' => '3.0.0',
            'info' => [
                'description' => 'APIs are available for all active clients, generate and manage your apis on [My APIs]('.MYACCOUNT_URL.'/api) page.
                                  All our APIs base on HTTPS requests and JSON responses. For suggestions, bug reports, questions, please send
                                  to [developers@wataads.com](mailto:developers@wataads.com)',
                'version' => '1.0.0',
                'title' => SITE_NAME.' APIs',
            ],
            'servers' => [
                [
                    'url' => API_URL.'/v1',
                    'description' => 'Production'
                ],
            ],
            'components' => [
                'securitySchemes' => [
                    'Bearer' => [
                        'in' => 'header',
                        'name' => 'API-Token',
                        'type' => 'apiKey',
                        'description' => 'API Token of your account.',
                    ]
                ]
            ],
            'security' => [
                [
                    'Bearer' => []
                ]
            ],
            'tags' => [
                [
                    'name' => 'Publisher',
                    'description' => "API integration for Publisher's Panel"
                ],
                [
                    'name' => 'Advertiser',
                    'description' => "API integration for Advertiser's Panel"
                ]
            ],
            'paths' => [
                // Pub account
                '/pub/balance' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get Publisher balance',
                        'operationId' => 'pub-balance',
                        'parameters' => [],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => '0'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [
                                                'error' => [
                                                    'type' => 'object',
                                                    'properties' => [],
                                                    'example' => [
                                                        'statusCode' => 403,
                                                        'success' => false,
                                                        'data' => 'Forbidden, missing API token in request headers !!!!!'
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                // Pub website
                '/pub/web' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get all Websites',
                        'operationId' => 'get-website',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'WataAds',
                                                            'domain' => 'www.wataads.com',
                                                            'description' => 'Website WataAds',
                                                            'status' => 'Active',
                                                            'category_id' => 1
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'Google',
                                                            'domain' => 'www.google.com',
                                                            'description' => 'Website Google',
                                                            'status' => 'Pending',
                                                            'category_id' => 2
                                                        ],
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                         
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no any website. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Create new Website',
                        'description' => 'Returns an array of service objects',
                        'operationId' => 'post-website',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min 6 character',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'description',
                                'description' => 'Min 10 characters',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 10
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'domain',
                                'description' => 'Input url format',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'pattern' => 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
                                    ]
                                ],
                            [
                                'in' => 'query',
                                'name' => 'category_id',
                                'description' => 'ID',
                                'required' => true,
                                'schema' =>['type' => 'integer']
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new website successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                '/pub/web/{id}' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get Website by ID',
                        'operationId' => 'get-website-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Website id',
                                'required' => false,
                                'schema' => [
                                    'type' => 'integer'
                                ],
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'name' => 'Website 1',
                                                    'domain' => 'www.facebook.com',
                                                    'description' => 'Website description',
                                                    'status' => 'Pending',
                                                    'category_id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Website id is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Update Website by ID',
                        'operationId' => 'update-website',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Website ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min 6 character',
                                'required' => true,
                                'schema' => ['type' => 'string', 'minLength' => 6]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'description',
                                'description' => 'Min 10 characters',
                                'required' => true,
                                'schema' => ['type' => 'string', 'minLength' => 10]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'category_id',
                                'description' => 'ID',
                                'required' => true,
                                'schema' => ['type' => 'integer']
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message' => 'Updated website successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Something wrong, please contact support !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Delete Website by ID',
                        'operationId' => 'delete-website',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Website ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Delete website 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Website 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                '/pub/web/{id}/onreport' => [
                    'put' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Show/Hide Website & included Zones from report',
                        'operationId' => 'on-report-web',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Website ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'opt',
                                'description' => 'Select show or hide from report',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'enum' => [ 'show', 'hide']
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message' => 'Updated website 1 to show/hide on report',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'message' => 'Website 1 already being showed/hidden from report, or not yours'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ], 
                ],
                
                // Pub ad zone
                '/pub/zone' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get all Zones',
                        'operationId' => 'get-zone',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'web_id',
                                'description' => 'Website ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data'=> [
                                                        [
                                                            'id'=> 1,
                                                            'name'=> 'Zone 1',
                                                            'ad_format'=> 1,
                                                            'description'=> 'Zone 1 description',
                                                            'status'=> 'Active',
                                                            'website_id'=> 20,
                                                            'setting' => [
                                                                'bid' => 0.059999999999999998,
                                                                'fallback' => 'https://www.google.com',
                                                                'frequency' => '2:24',
                                                                'native_type' => 'native',
                                                                'desktop_col' => 3,
                                                                'desktop_row' => 2,
                                                                'desktop_text_title' => 1,
                                                                'desktop_text_description' => 1,
                                                                'desktop_text_position' => 'bottom',
                                                                'desktop_spacing' => '10px',
                                                                'desktop_image' => '16:9',
                                                                'mobile_breaking' => '450px',
                                                                'mobile_col' => 1,
                                                                'mobile_row' => 2,
                                                                'mobile_text_title' => 1,
                                                                'mobile_text_description' => 1,
                                                                'mobile_text_position' => 'right',
                                                                'mobile_spacing' => '6px',
                                                                'mobile_image' => '16:9',
                                                                'native_css' => '',
                                                                'native_font' => 'monospace',
                                                                'native_align' => 'left',
                                                                'excluded_types' => [
                                                                    '1',
                                                                    '2'
                                                                ]
                                                            ]
                                                        ],
                                                        [
                                                            'id'=> 2,
                                                            'name'=> 'Zone 2',
                                                            'ad_format'=> 5,
                                                            'description'=> "Zone 2 's description",
                                                            'status'=> 'Active',
                                                            'website_id'=> 20,
                                                            'setting' => [
                                                                'bid' => 0.08,
                                                                'fallback' => 'https://www.facebook.com',
                                                                'frequency' => '2:24',
                                                                'native_type' => 'native',
                                                                'desktop_col' => 3,
                                                                'desktop_row' => 2,
                                                                'desktop_text_title' => 1,
                                                                'desktop_text_description' => 1,
                                                                'desktop_text_position' => 'bottom',
                                                                'desktop_spacing' => '10px',
                                                                'desktop_image' => '16:9',
                                                                'mobile_breaking' => '450px',
                                                                'mobile_col' => 1,
                                                                'mobile_row' => 2,
                                                                'mobile_text_title' => 1,
                                                                'mobile_text_description' => 1,
                                                                'mobile_text_position' => 'right',
                                                                'mobile_spacing' => '6px',
                                                                'mobile_image' => '16:9',
                                                                'native_css' => '',
                                                                'native_font' => 'monospace',
                                                                'native_align' => 'left',
                                                                'excluded_types' => [
                                                                    '1',
                                                                    '2'
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Website 1 has not any zone or it not your!!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Create new Zone',
                        'operationId' => 'post-zone',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'web_id',
                                'description' => 'Website ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'Ad zone 1',
                                            'description' => 'Description of Ad zone 1',
                                            'ad_format' => 2,
                                            'setting' => [
                                                'bid' => 0.06,
                                                'fallback' => 'https://www.google.com/',
                                                'frequency' => '2:24',
                                                'native_type' => 'native',
                                                'desktop_col' => 3,
                                                'desktop_row' => 2,
                                                'desktop_text_title' => 1,
                                                'desktop_text_description' => 1,
                                                'desktop_text_position' => 'bottom',
                                                'desktop_spacing' => '10px',
                                                'desktop_image' => '16:9',
                                                'mobile_breaking' => '450px',
                                                'mobile_col' => 1,
                                                'mobile_row' => 2,
                                                'mobile_text_title' => 1,
                                                'mobile_text_description' => 1,
                                                'mobile_text_position' => 'right',
                                                'mobile_spacing' => '6px',
                                                'mobile_image' => '16:9',
                                                'native_css' => '',
                                                'native_font' => 'monospace',
                                                'native_align' => 'left',
                                                'excluded_types' => ['1','2']
                                            ] 
                                        ]
                                    ]    
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new Zone successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Website 1 is not verified. Please verify first !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/pub/zone/{id}' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get Zone by ID',
                        'operationId' => 'get-zone-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Zone ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success'=> true,
                                                'data'=> [
                                                    'id'=> 1,
                                                    'name'=> 'Zone 1',
                                                    'ad_format'=> 5,
                                                    'description'=> "Zone 1 description",
                                                    'status'=> 'Active',
                                                    'website_id'=> 1,
                                                    'setting' => [
                                                        'bid' => 0.059999999999999998,
                                                        'fallback' => 'https://www.google.com',
                                                        'frequency' => '2:24',
                                                        'native_type' => 'native',
                                                        'desktop_col' => 3,
                                                        'desktop_row' => 2,
                                                        'desktop_text_title' => 1,
                                                        'desktop_text_description' => 1,
                                                        'desktop_text_position' => 'bottom',
                                                        'desktop_spacing' => '10px',
                                                        'desktop_image' => '16:9',
                                                        'mobile_breaking' => '450px',
                                                        'mobile_col' => 1,
                                                        'mobile_row' => 2,
                                                        'mobile_text_title' => 1,
                                                        'mobile_text_description' => 1,
                                                        'mobile_text_position' => 'right',
                                                        'mobile_spacing' => '6px',
                                                        'mobile_image' => '16:9',
                                                        'native_css' => '',
                                                        'native_font' => 'monospace',
                                                        'native_align' => 'left',
                                                        'excluded_types' => [
                                                            '1',
                                                            '2'
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Zone 1 is invalid or not your !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Update Zone by ID',
                        'operationId' => 'update-zone',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Zone ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'Ad zone 1',
                                            'description' => 'Description of Ad zone 1',
                                            'ad_format' => 2,
                                            'setting' => [
                                                'bid' => 0.06,
                                                'fallback' => 'https://www.google.com/',
                                                'frequency' => '2:24',
                                                'native_type' => 'native',
                                                'desktop_col' => 3,
                                                'desktop_row' => 2,
                                                'desktop_text_title' => 1,
                                                'desktop_text_description' => 1,
                                                'desktop_text_position' => 'bottom',
                                                'desktop_spacing' => '10px',
                                                'desktop_image' => '16:9',
                                                'mobile_breaking' => '450px',
                                                'mobile_col' => 1,
                                                'mobile_row' => 2,
                                                'mobile_text_title' => 1,
                                                'mobile_text_description' => 1,
                                                'mobile_text_position' => 'right',
                                                'mobile_spacing' => '6px',
                                                'mobile_image' => '16:9',
                                                'native_css' => '',
                                                'native_font' => 'monospace',
                                                'native_align' => 'left',
                                                'excluded_types' => ['1','2']
                                            ] 
                                        ]
                                    ]    
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Updated Ad Zone 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Could not update Zone 1 setting, is this zone yours?',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Delete Zone by ID',
                        'operationId' => 'delete-zone',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Zone ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Delete zone 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Zone 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                '/pub/zone/{id}/onreport' => [
                    'put' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Show/Hide Ad zone from report',
                        'operationId' => 'on-report-zone',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Zone ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'opt',
                                'description' => 'Select show or hide from report',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'enum' => [ 'show', 'hide']
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Updated Zone 1 to be shown/hidden from report successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Zone 1 is already being shown/hidden from report, or not yours!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Pub domain
                '/pub/domain' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get all Domains',
                        'operationId' => 'get-domain',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'www.facebook.com',
                                                            'status' => 'Active',
                                                            'is_default' => false
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'www.wataads.com',
                                                            'status' => 'Active',
                                                            'is_default' => true
                                                        ],
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no any domain. Please create new one !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Create new Domain',
                        'operationId' => 'post-domain',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Input url format',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'pattern' => 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'message '=> 'Created new domain successfully !!!!!'
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/pub/domain/{id}' => [
                    'get' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Get Domain by ID',
                        'operationId' => 'get-domain-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Domain ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'name' => 'www.facebook.com',
                                                    'status' => 'Active',
                                                    'is_default' => false
                                                ],
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Domain 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Change default Domain',
                        'operationId' => 'put-domain',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Domain ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message'=> 'Change default domain 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Domain 1 is invalid/was ready set default !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Publisher'],
                        'summary' => 'Delete Domain',
                        'operationId' => 'delete-domain',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Domain ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data'=> 'Removed domain 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data'=> 'Domain 1 not found or not your!!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv account
                '/adv/balance' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Advertiser balance',
                        'description' => 'Returns an array of service objects',
                        'operationId' => 'adv-balance',
                        'parameters' => [],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'balance' => '0'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [
                                                'error' => [
                                                    'type' => 'array',
                                                    'properties' => [],
                                                    'example' => [
                                                        'statusCode' => 403,
                                                        'success' => false,
                                                        'balance' => 'Forbidden, missing API token in request headers !!!!!'
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                // Adv campaign
                '/adv/campaign' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all Campaigns',
                        'operationId' => 'get-campaign',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 3,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'Campaign 1',
                                                            'status' => 'Pending',
                                                            'active_ad' => 1,
                                                            'total_ad' => 5,
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'Campaign 2',
                                                            'status' => 'Pending',
                                                            'active_ad' => 0,
                                                            'total_ad' => 1,
                                                        ],
                                                        [
                                                            'id' => 3,
                                                            'name' => 'Campaign 3',
                                                            'status' => 'Pending',
                                                            'active_ad' => 2,
                                                            'total_ad' => 2,
                                                        ],
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no any campaign. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new Campaign',
                        'operationId' => 'post-campaign',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min character : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'description',
                                'description' => 'Min character : 10',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 10
                                ]
                            ],
                            
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Create new campaign successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ]
                ],
                
                '/adv/campaign/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Campaign by ID',
                        'operationId' => 'get-campaign-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your campaign id',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'name' => 'Campaign 1',
                                                    'description' => 'Description of campaign 1',
                                                    'status' => 'Pending',
                                                    'total_ad' => 5,
                                                    'active_ad' => 3,
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Campaign 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Update Campaign by ID',
                        'operationId' => 'update-campaign',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your campaign id',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min 6 character',
                                'required' => true,
                                'schema' =>['type' => 'string', 'minLength' => 6]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'description',
                                'description' => 'Min 10 characters',
                                'required' => true,
                                'schema' =>['type' => 'string', 'minLength' => 10]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Updated campaign 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Campaign 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/campaign/{id}/action' => [
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Action Campaign by ID',
                        'operationId' => 'action-campaign',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your campaign id',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'opt',
                                'description' => 'Select campaign action',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'enum' => [ 'pause', 'stop', 'resume']
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => 'Paused/Resumed/Stopped campaign 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Could not pause/resume/stop the campaign 1. Please check Ads status again !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv ad
                '/adv/ad' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all Ads by Campaign ID',
                        'operationId' => 'get-ad',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'camp_id',
                                'description' => 'Campaign ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'Ad 1',
                                                            'ad_format' => 2,
                                                            'pricing_model' => 'cpm',
                                                            'bidding' => 0,
                                                            'optimization' => 'auto',
                                                            'budget_daily' => 500,
                                                            'budget_total' => 10000,
                                                            'budget_capping' => '0:1h',
                                                            'goal_daily' => 0,
                                                            'goal_total' => 0,
                                                            'goal_capping' => '0:1h',
                                                            'start_date' => '2020-10-22',
                                                            'end_date' => '2021-01-20',
                                                            'after_approval' => 'start',
                                                            'targeting' => [
                                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                                'country_include' => ['VN'],
                                                                'browser_include' => ['Chrome','MacOS'],
                                                                'platform_include' => ['Mobile'],
                                                                'os_include' => ['Android','iOS'],
                                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                                'time_include' => [
                                                                    '400',
                                                                    '401',
                                                                    '402',
                                                                    '403',
                                                                    '404',
                                                                    '405',
                                                                    '406',
                                                                    '407',
                                                                    '408',
                                                                    '409',
                                                                    '410',
                                                                    '411',
                                                                    '412',
                                                                    '413',
                                                                    '414',
                                                                    '415',
                                                                    '416',
                                                                    '417',
                                                                    '418',
                                                                    '419',
                                                                    '420',
                                                                    '421',
                                                                    '422',
                                                                    '423'
                                                                ],
                                                                'traffic' => 'all',
                                                                'audience_include' => [],
                                                                'website_include' => [],
                                                                'zone_include' => [],
                                                                'collect' => 'click:21'
                                                            ] 
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'Ad 2',
                                                            'ad_format' => 2,
                                                            'pricing_model' => 'cpm',
                                                            'bidding' => 0,
                                                            'optimization' => 'auto',
                                                            'budget_daily' => 200,
                                                            'budget_total' => 10000,
                                                            'budget_capping' => '0:1h',
                                                            'goal_daily' => 0,
                                                            'goal_total' => 0,
                                                            'goal_capping' => '0:1h',
                                                            'start_date' => '2020-10-22',
                                                            'end_date' => '2021-01-20',
                                                            'after_approval' => 'start',
                                                            'targeting' => [
                                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                                'country_include' => ['VN'],
                                                                'browser_include' => ['Chrome','MacOS'],
                                                                'platform_include' => ['Mobile'],
                                                                'os_include' => ['Android','iOS'],
                                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                                'time_include' => [
                                                                    '400',
                                                                    '401',
                                                                    '402',
                                                                    '403',
                                                                    '404',
                                                                    '405',
                                                                    '406',
                                                                    '407',
                                                                    '408',
                                                                    '409',
                                                                    '410',
                                                                    '411',
                                                                    '412',
                                                                    '413',
                                                                    '414',
                                                                    '415',
                                                                    '416',
                                                                    '417',
                                                                    '418',
                                                                    '419',
                                                                    '420',
                                                                    '421',
                                                                    '422',
                                                                    '423'
                                                                ],
                                                                'traffic' => 'all',
                                                                'audience_include' => [],
                                                                'website_include' => [],
                                                                'zone_include' => [],
                                                                'collect' => 'click:21'
                                                            ] 
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Campaign 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new Ad',
                        'operationId' => 'post-ad',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'camp_id',
                                'description' => 'Campaign ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'Ad 1',
                                            'ad_format' => 2,
                                            'pricing_model' => 'cpm',
                                            'bidding' => 0,
                                            'optimization' => 'auto',
                                            'budget_daily' => 0,
                                            'budget_total' => 10000,
                                            'budget_capping' => '0:1h',
                                            'goal_daily' => 0,
                                            'goal_total' => 0,
                                            'goal_capping' => '0:1h',
                                            'start_date' => '2020-10-22',
                                            'end_date' => '2021-01-20',
                                            'after_approval' => 'start',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => [],
                                                'website_include' => [],
                                                'zone_include' => [],
                                                'collect' => 'click:21'
                                            ] 
                                            ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new Ad successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Campaign 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/ad/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Ad by ID',
                        'operationId' => 'get-ad-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your Ad ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'name' => 'Ad 1',
                                                    'ad_format' => 2,
                                                    'pricing_model' => 'cpm',
                                                    'bidding' => 0,
                                                    'optimization' => 'auto',
                                                    'budget_daily' => 0,
                                                    'budget_total' => 10000,
                                                    'budget_capping' => '0:1h',
                                                    'goal_daily' => 0,
                                                    'goal_total' => 0,
                                                    'goal_capping' => '0:1h',
                                                    'start_date' => '2020-10-22',
                                                    'end_date' => '2021-01-20',
                                                    'after_approval' => 'start',
                                                    'targeting' => [
                                                        'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                        'country_include' => ['VN'],
                                                        'browser_include' => ['Chrome','MacOS'],
                                                        'platform_include' => ['Mobile'],
                                                        'os_include' => ['Android','iOS'],
                                                        'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                        'time_include' => [
                                                          '400',
                                                          '401',
                                                          '402',
                                                          '403',
                                                          '404',
                                                          '405',
                                                          '406',
                                                          '407',
                                                          '408',
                                                          '409',
                                                          '410',
                                                          '411',
                                                          '412',
                                                          '413',
                                                          '414',
                                                          '415',
                                                          '416',
                                                          '417',
                                                          '418',
                                                          '419',
                                                          '420',
                                                          '421',
                                                          '422',
                                                          '423'
                                                       ],
                                                        'traffic' => 'all',
                                                        'audience_include' => [],
                                                        'website_include' => [],
                                                        'zone_include' => [],
                                                        'collect' => 'click:21'
                                                    ] 
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Ad 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Update Ad by ID',
                        'operationId' => 'update-ad',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your Ad ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'Ad 1',
                                            'ad_format' => 2,
                                            'pricing_model' => 'cpm',
                                            'bidding' => 0,
                                            'optimization' => 'auto',
                                            'budget_daily' => 200,
                                            'budget_total' => 10000,
                                            'budget_capping' => '0:1h',
                                            'goal_daily' => 0,
                                            'goal_total' => 0,
                                            'goal_capping' => '0:1h',
                                            'start_date' => '2020-10-22',
                                            'end_date' => '2021-01-20',
                                            'after_approval' => 'start',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => [],
                                                'website_include' => [],
                                                'zone_include' => [],
                                                'collect' => 'click:21'
                                            ] 
                                        ]
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success'=> true,
                                                'data' => 'Updated Ad 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Ad 1 is invalid !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv pretargeting
                '/adv/pretargeting' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all PreTargeting',
                        'operationId' => 'get-pretargeting',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'PreTargeting 1',
                                                            "targeting" => [
                                                                "country_bidding" => [
                                                                    "AD" => "1"
                                                                ],
                                                                "url" => "https://google.com",
                                                                "ad_title" => "this is ad title",
                                                                "ad_description" => "this is ad description",
                                                                "country_include" => [
                                                                "AD"
                                                                ],
                                                                "browser_include" => [
                                                                "Chrome"
                                                                ],
                                                                "platform_include" => [
                                                                "Tablet"
                                                                ],
                                                                "os_include" => [
                                                                "iPadOS"
                                                                ],
                                                                "device_include" => [
                                                                "Apple iPad"
                                                                ],
                                                                "time_include" => [
                                                                "100",
                                                                "200",
                                                                "300",
                                                                "400",
                                                                "500",
                                                                "600",
                                                                "000"
                                                                ],
                                                                "traffic" => "all",
                                                                "audience_include" => [
                                                                "26",
                                                                "40"
                                                                ],
                                                                "website_include" => [
                                                                "1213",
                                                                "2132"
                                                                ],
                                                                "zone_include" => [
                                                                "2312",
                                                                "21111"
                                                                ],
                                                                "collect" => "click:1"
                                                            ]
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'PreTargeting 2',
                                                            "targeting" => [
                                                                "country_bidding" => [
                                                                    "AD" => "1"
                                                                ],
                                                                "url" => "https://google.com",
                                                                "ad_title" => "this is ad title",
                                                                "ad_description" => "this is ad description",
                                                                "country_include" => [
                                                                "AD"
                                                                ],
                                                                "browser_include" => [
                                                                "Chrome"
                                                                ],
                                                                "platform_include" => [
                                                                "Tablet"
                                                                ],
                                                                "os_include" => [
                                                                "iPadOS"
                                                                ],
                                                                "device_include" => [
                                                                "Apple iPad"
                                                                ],
                                                                "time_include" => [
                                                                "100",
                                                                "200",
                                                                "300",
                                                                "400",
                                                                "500",
                                                                "600",
                                                                "000"
                                                                ],
                                                                "traffic" => "all",
                                                                "audience_include" => [
                                                                "26",
                                                                "40"
                                                                ],
                                                                "website_include" => [
                                                                "1213",
                                                                "2132"
                                                                ],
                                                                "zone_include" => [
                                                                "2312",
                                                                "21111"
                                                                ],
                                                                "collect" => "click:1"
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no pretargeting. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new PreTargeting',
                        'operationId' => 'post-pretargeting',
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'PreTargeting 1',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => ["26","40"],
                                                'website_include' => ["1213","2132"],
                                                'zone_include' => ["2312","21111"],
                                                'collect' => 'click:26'
                                            ] 
                                        ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new pretargeting successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/pretargeting/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get PreTargeting by ID',
                        'operationId' => 'get-pretargeting-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'PreTargeting ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'name' => 'pretargeting 1',
                                                    "targeting" => [
                                                        "country_bidding" => [
                                                            "AD" => "1"
                                                        ],
                                                        "url" => "https://google.com",
                                                        "ad_title" => "this is ad title",
                                                        "ad_description" => "this is ad description",
                                                        "country_include" => [
                                                        "AD"
                                                        ],
                                                        "browser_include" => [
                                                        "Chrome"
                                                        ],
                                                        "platform_include" => [
                                                        "Tablet"
                                                        ],
                                                        "os_include" => [
                                                        "iPadOS"
                                                        ],
                                                        "device_include" => [
                                                        "Apple iPad"
                                                        ],
                                                        "time_include" => [
                                                        "100",
                                                        "200",
                                                        "300",
                                                        "400",
                                                        "500",
                                                        "600",
                                                        "000"
                                                        ],
                                                        "traffic" => "all",
                                                        "audience_include" => [
                                                        "26",
                                                        "40"
                                                        ],
                                                        "website_include" => [
                                                        "1213",
                                                        "2132"
                                                        ],
                                                        "zone_include" => [
                                                        "2312",
                                                        "21111"
                                                        ],
                                                        "collect" => "click:1"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Audience 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Update PreTargeting by ID',
                        'operationId' => 'update-pretargeting',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your PreTargeting ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'PreTargeting 1',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => ["26","40"],
                                                'website_include' => ["1213","2132"],
                                                'zone_include' => ["2312","21111"],
                                                'collect' => 'click:26'
                                            ] 
                                        ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message' => 'Updated pretargeting 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'PreTargeting 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Delete PreTargeting',
                        'operationId' => 'delete-pretargeting',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'PreTargeting ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data'=> 'Removed pretargeting 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data'=> 'PreTargeting 1 not found or not your!!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv creative
                '/adv/creative' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all Creative',
                        'operationId' => 'get-creative',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            "name" => "big_buck_bunny_480p_1mb.mp4",
                                                            "type" => "video",
                                                            "thumb" => "https://cdn.viranet.work/userdata/7/vExIeF0bBA.jpg",
                                                            "size" => "1.01M",
                                                            "url" => "https://cdn.viranet.work/userdata/7/vExIeF0bBA.mp4"
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            "name" => "big_buck_bunny_480p_1mb.mp4",
                                                            "type" => "image",
                                                            "thumb" => "https://cdn.viranet.work/userdata/7/wq3WF0nmfH.png",
                                                            "size" => "174x173",
                                                            "url" => "https://cdn.viranet.work/userdata/7/wq3WF0nmfH.png"
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no creative. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new Creative',
                        'operationId' => 'post-creative',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'name of creative',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'type',
                                'description' => 'type of creative (image/video)',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'example' => 'image'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'thumb',
                                'description' => 'thumb of creative',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'size',
                                'description' => 'size of creative',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'url',
                                'description' => 'url of creative',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string'
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new creative successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/creative/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Creative by ID',
                        'operationId' => 'get-creative-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Creative ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    "name" => "big_buck_bunny_480p_1mb.mp4",
                                                    "type" => "video",
                                                    "thumb" => "https://cdn.viranet.work/userdata/7/vExIeF0bBA.jpg",
                                                    "size" => "1.01M",
                                                    "url" => "https://cdn.viranet.work/userdata/7/vExIeF0bBA.mp4"
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'creative 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Delete Creative',
                        'operationId' => 'delete-creative',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Creative ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data'=> 'Removed creative 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data'=> 'creative 1 not found or not your!!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv audience
                '/adv/audience' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all Audiences',
                        'operationId' => 'get-audience',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'Audience 1',
                                                            'duration' => 120,
                                                            'daily_reach' => 100000,
                                                            'total_users' => 1000000,
                                                            'status' => 'Active',
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'Audience 2',
                                                            'duration' => 90,
                                                            'daily_reach' => 50000,
                                                            'total_users' => 200000,
                                                            'status' => 'Active',
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no audience. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new audience',
                        'operationId' => 'post-audience',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min character: 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'duration',
                                'description' => 'Default value: 90 days',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 90
                                ]
                            ],
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new audience successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/audience/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Audience by ID',
                        'operationId' => 'get-audience-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Audience ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'name' => 'audience 1',
                                                    'duration' => 90,
                                                    'daily_reach' => 200000,
                                                    'total_users' => 10000000,
                                                    'status' => 'Active',
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Audience 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Update Audience by ID',
                        'operationId' => 'update-audience',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Audience ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'name',
                                'description' => 'Min character: 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'string',
                                    'minLength' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'duration',
                                'description' => 'Default value: 90 days',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 90
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message' => 'Updated audience 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Audience 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv standar report
                '/adv/report' => [
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new report',
                        'operationId' => 'post-report',
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'PreTargeting 1',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => ["26","40"],
                                                'website_include' => ["1213","2132"],
                                                'zone_include' => ["2312","21111"],
                                                'collect' => 'click:26'
                                            ] 
                                        ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new report successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/report/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Report by ID',
                        'operationId' => 'get-report-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Report ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'data' => 'report 1',
                                                    'status' => 'Active',
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'report 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                // Adv schedule report
                '/adv/schedule-report' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get all Scheduled report',
                        'operationId' => 'get-schedule',
                        'parameters' => [
                            [
                                'in' => 'query',
                                'name' => 'per_page',
                                'description' => 'Default value : 6',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 6
                                ]
                            ],
                            [
                                'in' => 'query',
                                'name' => 'page',
                                'description' => 'Default value : 0',
                                'required' => true,
                                'schema' => [
                                    'type' => 'number',
                                    'example' => 0
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'total' => 2,
                                                    'data' => [
                                                        [
                                                            'id' => 1,
                                                            'name' => 'Report schedule 1',
                                                            'duration' => 120,
                                                            'daily_reach' => 100000,
                                                            'total_users' => 1000000,
                                                            'status' => 'Active',
                                                        ],
                                                        [
                                                            'id' => 2,
                                                            'name' => 'Report schedule 2',
                                                            'duration' => 90,
                                                            'daily_reach' => 50000,
                                                            'total_users' => 200000,
                                                            'status' => 'Active',
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data' => 'Have no schedule report. Please create new one !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'post' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Create new report',
                        'operationId' => 'post-schedule',
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'PreTargeting 1',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => ["26","40"],
                                                'website_include' => ["1213","2132"],
                                                'zone_include' => ["2312","21111"],
                                                'collect' => 'click:26'
                                            ] 
                                        ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 201,
                                                'success' => true,
                                                'data' => [
                                                    'message' => 'Created new report successfully !!!!!',
                                                    'id' => 1
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 500,
                                                'success' => false,
                                                'data' => 'Sorry, something was wrong, please try again or contact our support team !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
                
                '/adv/schedule-report/{id}' => [
                    'get' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Get Report by ID',
                        'operationId' => 'get-schedule-report-id',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Report ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data' => [
                                                    'id' => 1,
                                                    'data' => 'report 1',
                                                    'status' => 'Active',
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'report 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'put' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Update Scheduled report by ID',
                        'operationId' => 'update-schedule-report',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Your Scheduled report ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'requestBody' => [
                            'description' => 'Input body',
                            'required' => true,
                            'content' => [
                                'application/json' => [
                                    'schema' => [
                                        'type' => 'object',
                                        'properties' => [],
                                        'example' => [
                                            'name' => 'PreTargeting 1',
                                            'targeting' => [
                                                'url' =>'https://your-landing-page.com?ad_id={ad_id}&country={country}&platform={platform}',
                                                'country_include' => ['VN'],
                                                'browser_include' => ['Chrome','MacOS'],
                                                'platform_include' => ['Mobile'],
                                                'os_include' => ['Android','iOS'],
                                                'device_include' => ['Apple iPhone','Samsung Galaxy Note'],
                                                'time_include' => [
                                                    '400',
                                                    '401',
                                                    '402',
                                                    '403',
                                                    '404',
                                                    '405',
                                                    '406',
                                                    '407',
                                                    '408',
                                                    '409',
                                                    '410',
                                                    '411',
                                                    '412',
                                                    '413',
                                                    '414',
                                                    '415',
                                                    '416',
                                                    '417',
                                                    '418',
                                                    '419',
                                                    '420',
                                                    '421',
                                                    '422',
                                                    '423'
                                                ],
                                                'traffic' => 'all',
                                                'audience_include' => ["26","40"],
                                                'website_include' => ["1213","2132"],
                                                'zone_include' => ["2312","21111"],
                                                'collect' => 'click:26'
                                            ] 
                                        ] 
                                    ]
                                ]    
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'message' => 'Updated schedule report 1 successfully !!!!!',
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 412,
                                                'success' => false,
                                                'data' => 'Schedule report 1 is invalid !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                    'delete' => [
                        'tags' => ['Advertiser'],
                        'summary' => 'Delete Schedule report',
                        'operationId' => 'delete-schedule-report',
                        'parameters' => [
                            [
                                'in' => 'path',
                                'name' => 'id',
                                'description' => 'Schedule report ID',
                                'required' => true,
                                'schema' => [
                                    'type' => 'integer'
                                ]
                            ]
                        ],
                        'responses' => [
                            'success' => [
                                'description' => 'Success response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'array',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 200,
                                                'success' => true,
                                                'data'=> 'Removed Schedule report 1 successfully !!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                                        
                            ],
                            'error' => [
                                'description' => 'Error response',
                                'content' => [
                                    'application/json' => [
                                        'schema' => [
                                            'type' => 'object',
                                            'properties' => [],
                                            'example' => [
                                                'statusCode' => 404,
                                                'success' => false,
                                                'data'=> 'Schedule report 1 not found or not your!!!!!'
                                            ]
                                        ]
                                    ]
                                ]
                            ],
                        ]
                    ],
                ],
            ],
        ];

        header('Access-Control-Allow-Origin: '.API_URL);
        header('Access-Control-Allow-Credentials: true');
        header('Access-control-allow-methods: GET, POST, DELETE, PUT');
        header('Access-Control-Allow-Headers: Authorization');
        header('Content-Type: application/json; charset=utf-8');
        $this->renderView();
    }
}