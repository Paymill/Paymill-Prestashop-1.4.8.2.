<link rel="stylesheet" type="text/css" href="{$components}paymill_styles.css" />
<script type="text/javascript">
    var PAYMILL_PUBLIC_KEY = '{$public_key}';
</script>
<script type="text/javascript" src="{$bridge_url}"></script>
<script type="text/javascript">
    $(document).ready(function() {
    $("#submitButton").click(function(event) {
    var form = $("#submitForm");
    form.append("<input type='hidden' name='paymillToken' value='dummyToken'/>");
    form.submit();
});
});
</script>

{capture name=path}{l s='Paymill' mod='pigmbhpaymill'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Order summary' mod='pigmbhpaymill'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
    <p class="warning">{l s='Your cart is empty.' mod='pigmbhpaymill'}</p>
{else}

    <h3>{l s='Paymill payment' mod='pigmbhpaymill'}</h3>
    <form id='submitForm' action="{$this_path_ssl}controllers/front/validation.php" method="post">
        <div class="error" style="display: none">
            <ul id="errors">
            </ul>
        </div>
        {if $payment == "creditcard"}
            <input type="hidden" name="payment" value="creditcard">
            <div class="debit">
                {if $paymill_show_label == 'true'}
                    <p><div class="paymill_powered"><div class="paymill_credits">{l s='Save creditcardpayment powered by' mod='pigmbhpaymill'} <a href="http://www.paymill.de" target="_blank">PAYMILL</a></div></div></p>
                {/if}
            </div>
        {elseif $payment == "debit"}
            <input type="hidden" name="payment" value="debit">
            <div class="debit">
                {if $paymill_show_label == 'true'}
                    <p><div class="paymill_powered"><div class="paymill_credits">{l s='debitpayment powered by' mod='pigmbhpaymill'} <a href="http://www.paymill.de" target="_blank">PAYMILL</a></div></div></p>
                {/if}
            </div>
        {/if}

        <p class="cart_navigation">
            <a href="{$link->getPageLink('order.php', true)}?step=3" class="button_large">{l s='Payment selection' mod='pigmbhpaymill'}</a>
            <input type="button" id='submitButton' value="{l s='Order' mod='pigmbhpaymill'}" class="exclusive_large" />
        </p>
    </form>
{/if}