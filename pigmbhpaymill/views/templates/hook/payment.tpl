{if $creditcard === 'on' && $valid_key}
    <p class="payment_module">
        <a href="{$this_path_ssl}payment.php?payment=creditcard" title="{l s='Paymill Creditcard' mod='pigmbhpaymill'}">
            <img src="{$this_path_ssl}/../logo.gif">
            {l s='Paymill Creditcard' mod='pigmbhpaymill'}
        </a>
    </p>
{/if}
{if $debit === 'on' && $valid_key}
    <p class="payment_module">
        <a href="{$this_path_ssl}payment.php?payment=debit" title="{l s='Paymill Directdebit' mod='pigmbhpaymill'}">
            <img src="{$this_path_ssl}/../logo.gif">
            {l s='Paymill Directdebit' mod='pigmbhpaymill'}
        </a>
    </p>
{/if}