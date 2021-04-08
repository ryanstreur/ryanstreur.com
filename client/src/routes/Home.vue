<template>
  <div>
    <h1>Ryan Streur</h1>
    <p>Software Developer</p>
    <div v-for="(exp, i) in resume.experience" :key="i">
      {{ exp.position }} - {{ exp.company }}
    </div>
  </div>

</template>
<script>
import yaml from "js-yaml";

export default {
  created() {
    fetch("/data/resume.yml")
      .then((res) => res.text())
      .then((t) => {
        console.log(t);
        const resumeData = yaml.load(t);
        if (resumeData) {
          this.resume = resumeData;
        }
      });
  },
  data() {
    return {
      resume: {
        experience: [],
      },
    };
  },
  mehods: {},
};
</script>
