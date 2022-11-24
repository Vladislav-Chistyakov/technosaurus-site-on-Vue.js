<template>
<ul class="catalog__list">
  <ProductItem v-for="(product, index) in products" :key="index" :product="product"/>
</ul>
</template>

<script>
// Импортируем компонент ProductItem
import ProductItem from './ProductItem.vue';

// берём массив product и принимаем компонент ProductItem
export default {
  props: ['products'],
  components: { ProductItem },
};
</script>
