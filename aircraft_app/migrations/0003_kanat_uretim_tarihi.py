# Generated by Django 3.2.25 on 2024-10-23 14:06

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('aircraft_app', '0002_kanat'),
    ]

    operations = [
        migrations.AddField(
            model_name='kanat',
            name='uretim_tarihi',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
