# Generated by Django 3.2.25 on 2024-10-25 10:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aircraft_app', '0009_auto_20241024_2117'),
    ]

    operations = [
        migrations.AlterField(
            model_name='aviyonik',
            name='status',
            field=models.CharField(choices=[('uygun', 'Uygun'), ('kullanimda', 'kullanimda')], default='uygun', max_length=20),
        ),
        migrations.AlterField(
            model_name='govde',
            name='status',
            field=models.CharField(choices=[('uygun', 'Uygun'), ('kullanimda', 'kullanimda')], default='uygun', max_length=20),
        ),
        migrations.AlterField(
            model_name='kanat',
            name='status',
            field=models.CharField(choices=[('uygun', 'Uygun'), ('kullanimda', 'kullanimda')], default='uygun', max_length=20),
        ),
        migrations.AlterField(
            model_name='kuyruk',
            name='status',
            field=models.CharField(choices=[('uygun', 'Uygun'), ('kullanimda', 'kullanimda')], default='uygun', max_length=20),
        ),
    ]