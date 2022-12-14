<template>
  <ul class="cart__orders" v-if="!pageInfo">
    <OrderProductItem v-for="item in products" :key="item.productId"
    :title="item.product.title" :id-product="item.productId" :price="item.product.price * item.amount"/>
  </ul>
  <ul class="cart__orders" v-else-if="pageInfo">
    <OrderProductItem v-for="item in products" :key="item.product.id"
    :title="item.product.title" :id-product="item.product.id" :price="item.product.price * item.quantity"/>
  </ul>
</template>

<script>
import OrderProductItem from './OrderProductItem.vue';
export default {
  components: { OrderProductItem },
  props: ['products', 'pageInfo'],
}
</script>
