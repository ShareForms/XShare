<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Confirmator.ascx.cs" Inherits="XShare.WebForms.Controls.Confirmator.Confirmator" %>

<div class="modal fade noselect" tabindex="-1" id="confirmator" role="dialog">
    <div class="modal-dialog">
        <div class="">
            <div class="alert noselect"  id="confirmator-body">
                <div class="modal-header noselect">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title noselect" id="confirmator-title">X-title</h4>
                </div>
                <div class="modal-body noselect wtap-words" id="confirmator-text" >
                </div>
                <div class="modal-footer noselect">
                    <button type="button" class="btn btn-lg noselect" id="btn-xconfirm">Do it!</button>
                    <button type="button" class="btn btn-primary noselect" id="btn-xcancel" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
