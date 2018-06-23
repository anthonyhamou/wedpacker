function customStripeButton() {
  const button = document.getElementById('payment-button');

  if (button) {
    var handler = StripeCheckout.configure({
      key: button.dataset.key,
      image: button.dataset.logo,
      locale: 'auto',
      token: function(token) {
        // You can access the token ID with `token.id`.
        // Get the token ID to your server-side code for use.
        // console.log("token");
        // console.log(token.id);

        const stripeTokenInput = document.getElementById("stripe-token");
        stripeTokenInput.value = token.id;

        const paymentForm = document.getElementById("payment-form");
        paymentForm.submit();
      }
    });

    button.addEventListener('click', function(e) {
      // Open Checkout with further options:
      handler.open({
        name: button.dataset.name,
        description: button.dataset.description,
        currency: button.dataset.currency,
        amount: button.dataset.amount,
        locale: button.dataset.locale,
        email: button.dataset.email
      });
      e.preventDefault();
    });

    // Close Checkout on page navigation:
    window.addEventListener('popstate', function() {
      handler.close();
    });
  }
}

export { customStripeButton };
