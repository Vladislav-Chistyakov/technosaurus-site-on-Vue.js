<template>
  <li class="cart__order">
    <h3>{{ title }}</h3>
    <b>{{ price | numberFormat }} ₽</b>
    <span>Артикул: {{ idProduct }}</span>
  </li>
</template>

<script>
import numberFormat from '@/helpers/numberFormat';

export default {
  props: ['title', 'price', 'idProduct'],
  filters: {numberFormat},
}
</script>
