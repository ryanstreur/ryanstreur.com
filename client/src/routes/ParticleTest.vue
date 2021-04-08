<template>
  <Particles id="tsparticles" :options="particleOptions"></Particles>
</template>
<script>
const particleOptions = {
  background: {
    color: {
      value: "#663399",
    },
  },
  fpsLimit: 60,
  interactivity: {
    detectsOn: "canvas",
    events: {
      onClick: {
        enable: true,
        mode: "push",
      },
      onHover: {
        enable: true,
        mode: "repulse",
      },
      resize: true,
    },
    modes: {
      bubble: {
        distance: 400,
        duration: 4,
        opacity: 0.8,
        size: 40,
        speed: 3,
      },
      push: {
        quantity: 4,
      },
      repulse: {
        distance: 100,
        duration: 1,
      },
    },
  },
  particles: {
    color: {
      value: "#ffffff",
    },
    links: {
      color: "#ffffff",
      distance: 150,
      enable: true,
      opacity: 0.5,
      width: 1,
    },
    collisions: {
      enable: false,
    },
    move: {
      direction: "none",
      enable: true,
      outMode: "bounce",
      random: false,
      speed: 2,
      straight: false,
    },
    number: {
      density: {
        enable: true,
        value_area: 800,
      },
      value: 80,
    },
    opacity: {
      value: 1,
    },
    shape: {
      // type: "circle",
      type: "image",
      options: {
        images: [
          {
            src: "/img/goats/goat1.png",
            height: 400,
            width: 400,
          },
          {
            src: "/img/goats/goat2.png",
            height: 400,
            width: 400,
          },
          {
            src: "/img/goats/goat3.png",
            height: 400,
            width: 400,
          },
          {
            src: "/img/goats/goat4.png",
            height: 400,
            width: 400,
          },
          {
            src: "/img/goats/goat5.png",
            height:400,
            width: 400,
          },
          {
            src: "/img/goats/goat6.png",
            height: 400,
            width: 400,
          },
        ],
      },
    },
    size: {
      random: true,
      value: {
        min: 15,
        max: 30
      }
    },
  },
  detectRetina: true,
};
export default {
  data() {
    return {
      particleOptions,
    };
  },
};
</script>
<style scoped>
#tsparticles {
  height: 100%;
  width: 100%;
}
</style>
