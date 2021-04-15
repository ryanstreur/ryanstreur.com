from django.db import models


class Responsibility(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = "Responsibilities"


class SkillLevel(models.IntegerChoices):
    BEGINNER = 1
    INTERMEDIATE = 2
    PROFICIENT = 3


class Skill(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, default="")
    level = models.SmallIntegerField(choices=SkillLevel.choices)

    def __str__(self):
        return self.name


class Job(models.Model):
    title = models.CharField(max_length=200)
    employer = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    current = models.BooleanField(
        default=False, help_text="Are you working this job currently?"
    )
    skills = models.ManyToManyField(to=Skill)

    def __str__(self):
        return ", ".join([self.title, self.employer])
