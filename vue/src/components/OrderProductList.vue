<template>
  <ul class="cart__orders">
    <OrderProductItem v-for="item in products" :key="item.productId" :title="item.product.title" :id-product="item.productId" :price="item.product.price"/>
  </ul>
</template>

<script>
import OrderProductItem from './OrderProductItem.vue';
export default {
  components: { OrderProductItem },
  props: ['products'],
}
</script>
