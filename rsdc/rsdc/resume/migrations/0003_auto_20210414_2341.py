# Generated by Django 3.1.8 on 2021-04-14 23:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resume', '0002_job_skills'),
    ]

    operations = [
        migrations.AlterField(
            model_name='skill',
            name='level',
            field=models.SmallIntegerField(choices=[(1, 'Beginner'), (2, 'Intermediate'), (3, 'Proficient')]),
        ),
    ]
