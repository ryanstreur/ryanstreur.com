from django.contrib.auth import get_user_model
from rest_framework import serializers

from rsdc.resume import models



class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Job
        fields = "__all__"

class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Skill
        fields = "__all__"
