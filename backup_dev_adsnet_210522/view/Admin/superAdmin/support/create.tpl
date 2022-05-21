<style>
    .media {
        align-items: flex-start;
        display: flex;
        text-align: inherit;
    }
    .media-left {
        margin-right: 1rem;
    }
    .media-left, .media-right {
        flex-basis: auto;
        flex-grow: 0;
        flex-shrink: 0;
    }
    .media-content {
        flex-basis: auto;
        flex-grow: 1;
        flex-shrink: 1;
        text-align: inherit;
    }
    .image.is-64x64 {
        height: 64px;
        width: 64px;
    }

    .image {
        display: block;
        position: relative;
    }
    .image img {
        display: block;
        height: auto;
        width: 100%;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Compose Ticket</h4>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <article class="media">
                                        <figure class="media-left">
                                            <p class="image is-64x64">
                                                <img src="<?=$this->asset2('img/staff.svg')?>">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <div class="form-group">

                                                <select id="service" class="form-control">
                                                    <option value="global">Global</option>
                                                    <option value="publisher">Publisher</option>
                                                    <option value="advertiser">Advertiser</option>
                                                </select>

                                            </div>
                                            <div class="form-group">
                                                <p class="control">
                                                    <input id="user_id" class="form-control" type="text" data-type="tags" autocomplete="off" placeholder="Member's IDs" value="">
                                                </p>
                                            </div>
                                            <div class="form-group">
                                                <p class="control">
                                                    <input class="form-control" id="subject" placeholder="Your Subject">
                                                </p>
                                            </div>
                                            <div class="form-group">
                                                <p class="control">
                                                    <textarea class="form-control" id="message" placeholder="Your Message..."></textarea>
                                                </p>
                                            </div>
                                            <div class="field is-grouped text-center">
                                                <div class="control">
                                                    <button class="btn btn-primary btn-link" id="ticket_submit">
                                                        <i class="feather icon-plus"></i>
                                                        <span>Create</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script>
/* global $, __tajs, BulmaTagsInput */
// BulmaTagsInput.attach('[data-type="tags"]', {
//     allowDuplicates: false,
// 	caseSensitive: false,
// 	clearSelectionOnTyping: false,
// 	closeDropdownOnItemSelect: true,
// 	delimiter: ',',
// 	freeInput: true,
// 	highlightDuplicate: true,
// 	highlightMatchesString: true,
// 	itemValue: undefined,
//   	itemText: undefined,
// 	maxTags: undefined,
// 	maxChars: undefined,
// 	minChars: 1,
// 	noResultsLabel: 'No results found',
// 	placeholder: '',
// 	removable: true,
// 	searchMinChars: 2,
// 	searchOn: 'text',
// 	selectable: false,
// 	source: undefined,
// 	tagClass: 'is-rounded is-success',
// 	trim: true
// });
// var user_tags = document.getElementById('user_id').BulmaTagsInput();
$(document).ready(function() {
    $('#ticket_submit').on('click', function() {
        var $this = $(this), service = $('#service').val(), subject = $.trim($('#subject').val()), message = $.trim($('#message').val()), user_id = $('#user_id').val();
        console.log(service, user_id, subject, message)
        if(!service) {
            __tajs.showAlert('Invalid service!');
            return false;
        }
        if(!user_id) {
            __tajs.showAlert('Please fill the User ID');
            return false;
        }
        if (subject.length < 10) {
            __tajs.showAlert('Your subject is too short');
            return false;
        }
        if (message.length < 10) {
            __tajs.showAlert('Your message is too short');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/create', {
            csrf_token: __tajs.csrf,
            user_id: user_id,
            service: service,
            subject: subject,
            message: message
        }, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
            }
            else {
                __tajs.showAlert(res.data, 'success');
            }
        });
    });
});
</script>