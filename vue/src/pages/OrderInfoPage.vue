<template>

  <main class="content container" >
    <div v-if="statusLoading">
    <h2 class="content__title" >Заказ загружается</h2>
    </div>
    <div v-else-if="statusOrder">
      <h2 class="content__title" >Произошла ошибка с выводом вашего заказа</h2>
    </div>
    <div v-else-if="orderInfo && status">
      <div class="content__top">
      <ul class="breadcrumbs">
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link" href="index.html">
            Каталог
          </a>
        </li>
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link" href="cart.html">
            Корзина
          </a>
        </li>
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link">
            Оформление заказа
          </a>
        </li>
      </ul>

      <h1 class="content__title">
        Заказ оформлен <span>№ {{ orderInfo.id }}</span>
      </h1>
    </div>

    <section class="cart" >
      <form class="cart__form form" action="#" method="POST">
        <div class="cart__field">
          <p class="cart__message">
            Благодарим за&nbsp;выбор нашего магазина. На&nbsp;Вашу почту придет письмо с&nbsp;деталями заказа.
            Наши менеджеры свяжутся с&nbsp;Вами в&nbsp;течение часа для уточнения деталей доставки.
          </p>

          <ul class="dictionary">
            <li class="dictionary__item">
              <span class="dictionary__key">
                Получатель
              </span>
              <span class="dictionary__value">
                {{ orderInfo.name }}
              </span>
            </li>
            <li class="dictionary__item">
              <span class="dictionary__key">
                Адрес доставки
              </span>
              <span class="dictionary__value">
                {{ orderInfo.address }}
              </span>
            </li>
            <li class="dictionary__item">
              <span class="dictionary__key">
                Телефон
              </span>
              <span class="dictionary__value">
                {{ orderInfo.phone }}
              </span>
            </li>
            <li class="dictionary__item">
              <span class="dictionary__key">
                Email
              </span>
              <span class="dictionary__value">
                {{ orderInfo.email }}
              </span>
            </li>
            <li class="dictionary__item">
              <span class="dictionary__key">
                Способ оплаты
              </span>
              <span class="dictionary__value">
                картой при получении
              </span>
            </li>
          </ul>
        </div>
        <OrderInfoWindow v-if="status" :products="orderInfo"/>
      </form>
    </section>
    </div>
  </main>
</template>

<script>
import OrderInfoWindow from '@/components/OrderInfoWindow.vue';


  export default {
    components: { OrderInfoWindow },
    data() {
      return {
        orderInfo: {},
        statusOrder: false,
        status: false,
        statusLoading: false,
      };
    },
    created() {
      if (this.$store.state.orderInfo && this.$store.state.orderInfo.id === this.$route.params.id) {
        this.orderInfo = this.$store.state.orderInfo;
        this.status = true;
        return;
      } else {
        this.statusLoading = true;
        this.$store.dispatch('loadOrderInfo', this.$route.params.id)
          .then(() => {
            this.orderInfo = this.$store.state.orderInfo;
            this.status = true;
            this.statusLoading = false;
          }
        ).catch(() => {
          this.statusLoading = false;
          this.statusOrder = true;
          this.status = false;
        });
        return;
      }
    },
  }
</script>
