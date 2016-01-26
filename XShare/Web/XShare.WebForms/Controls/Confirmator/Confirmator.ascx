<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Confirmator.ascx.cs" Inherits="XShare.WebForms.Controls.Confirmator.Confirmator" %>

<div class="modal fade" tabindex="-1" id="confirmator" role="dialog">
    <div class="modal-dialog">
        <div class="alert" id="confirmator-body">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="confirmator-title">X-title</h4>
            </div>
            <div class="modal-body">
                <p id="confirmator-text">X-message</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="btn-confirm">Do it!</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
