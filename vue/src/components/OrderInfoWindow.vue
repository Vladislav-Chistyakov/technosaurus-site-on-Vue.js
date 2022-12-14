<template>
<div class="cart__block">
  <!--<ul class="cart__orders">
    <li class="cart__order">
      <h3>Смартфон Xiaomi Redmi Note 7 Pro 6/128GB</h3>
      <b>18 990 ₽</b>
      <span>Артикул: 150030</span>
    </li>
    <li class="cart__order">
      <h3>Гироскутер Razor Hovertrax 2.0ii</h3>
      <b>4 990 ₽</b>
      <span>Артикул: 150030</span>
    </li>
    <li class="cart__order">
      <h3>Электрический дрифт-карт Razor Lil’ Crazy</h3>
      <b>8 990 ₽</b>
      <span>Артикул: 150030</span>
    </li>
  </ul>-->

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
