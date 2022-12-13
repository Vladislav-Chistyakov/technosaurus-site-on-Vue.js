<template>
  <div class="cart__block">
    <OrderProductList :products="products"/>
    <div class="cart__total">
      <p>Доставка: <b>500 ₽</b></p>
      <p>Итого: <b v-if="(amountProducts > 1 && amountProducts <= 4)">
        {{ amountProducts }} товара
      </b>
      <b v-else-if="(amountProducts === 1)">
        {{ amountProducts }} товар
      </b>
      <b v-else>
        {{ amountProducts }} товаров
      </b> на сумму <b>{{ finalPrice + priceForDelivery | numberFormat}} ₽</b></p>
    </div>

    <button class="cart__button button button--primery" type="submit">
      Оформить заказ
    </button>
  </div>
</template>

<script>
import numberFormat from '@/helpers/numberFormat';
import OrderProductList from './OrderProductList.vue';

export default {
  data() {
    return {
      priceForDelivery: 500,
    };
  },
  components: {OrderProductList},
  props: ['products', 'finalPrice', 'amountProducts'],
  filters: {numberFormat},
}
</script>
