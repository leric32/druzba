# Generated by Django 4.0.4 on 2022-11-18 23:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('druzbaApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='idu',
            field=models.ForeignKey(blank=True, db_column='idU', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
    ]
