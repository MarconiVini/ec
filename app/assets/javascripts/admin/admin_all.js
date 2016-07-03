$(function() {
    $('.money').maskMoney({thousands:'.', decimal:',', allowZero:true, prefix: 'R$ '}).maskMoney('mask');
});