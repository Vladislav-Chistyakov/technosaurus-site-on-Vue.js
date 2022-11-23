<template>
<ul class="catalog__list">
  <ProductItem :products="products"/>
</ul>
</template>

<script>
import ProductItem from './ProductItem.vue';

export default {
  props: ['products'],
  components: { ProductItem },
};
</script>
