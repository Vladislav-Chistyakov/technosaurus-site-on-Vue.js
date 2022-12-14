<template>
<div class="cart__block">

  <OrderProductListVue :products="products.basket.items" :page-info="1"></OrderProductListVue>

  <div class="cart__total">
    <p>Доставка: <b>{{ priceForDelivery }} ₽</b></p>
    <p>Итого: <b>{{ amount }}</b> товара на сумму <b>{{ products.totalPrice + priceForDelivery  | numberFormat }} ₽</b></p>
  </div>
</div>
</template>

<script>
import OrderProductListVue from './OrderProductList.vue';
import numberFormat from '@/helpers/numberFormat';

export default {
  components: {OrderProductListVue},
  data() {
    return {
      priceForDelivery: 500,
    };
  },
  props: ['products'],
  //quantity
  filters: {numberFormat},
  computed: {
    amount() {
      let amount = 0;
      for (let item of this.products.basket.items) {
        amount += item.quantity;
      }
      return amount
    },
  }
}
</script>
