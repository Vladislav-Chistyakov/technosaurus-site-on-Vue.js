<template>
<li class="cart__item product">
  <div class="product__pic">
    <img :src="item.product.image" width="120" height="120" :alt="item.product.title">
  </div>
  <h3 class="product__title">
    {{ item.product.title }}
  </h3>
  <span class="product__code">
    Артикул: {{ item.product.id }}
  </span>

  <div class="product__counter form__counter">
    <button @click.number="removeOneItem(amount)" type="button" aria-label="Убрать один товар">
      <svg width="10" height="10" fill="currentColor">
        <use xlink:href="#icon-minus"></use>
      </svg>
    </button>

    <input type="text" v-model.number="amount" name="count">

    <button @click.number="addOneItem(amount)" type="button" aria-label="Добавить один товар">
      <svg width="10" height="10" fill="currentColor">
        <use xlink:href="#icon-plus"></use>
      </svg>
    </button>
  </div>

  <b class="product__price">
    {{ (item.amount * item.product.price) | numberFormat }} ₽
  </b>

  <button class="product__del button-del" type="button" @click.prevent="deleteProductsToCart()" aria-label="Удалить товар из корзины">
    <svg width="20" height="20" fill="currentColor">
      <use xlink:href="#icon-close"></use>
    </svg>
  </button>
</li>
</template>

<script>
import numberFormat from '@/helpers/numberFormat';
import { mapMutations } from 'vuex';



  export default {
    filters: {numberFormat},
    props: ['item'],
    computed: {
      amount: {
        get() {
          return this.item.amount;
        },
        set(value) {
          this.$store.dispatch('updateCartProductAmount', {productId: this.item.productId, amount: value});
        }
      },
    },
    methods: {
      ...mapMutations({deleteProduct: 'deleteCartProduct'}),
      deleteProductsToCart() {
        this.$store.dispatch('deleteProductToCart', this.item.productId);
      },
      removeOneItem(value){
        if (value != 1) {
          this.$store.dispatch('updateCartProductAmount', {productId: this.item.productId, amount: value - 1});
        }
      },
      addOneItem(value){
        this.$store.dispatch('updateCartProductAmount', {productId: this.item.productId, amount: value + 1});
      },
    },
  };
</script>
