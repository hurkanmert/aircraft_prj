# Generated by Django 3.2.25 on 2024-10-24 18:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('aircraft_app', '0007_ucak'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ucak',
            old_name='aviyonik_seri_no',
            new_name='aviyonik_serial',
        ),
        migrations.RenameField(
            model_name='ucak',
            old_name='govde_seri_no',
            new_name='govde_serial',
        ),
        migrations.RenameField(
            model_name='ucak',
            old_name='kanat_seri_no',
            new_name='kanat_serial',
        ),
        migrations.RenameField(
            model_name='ucak',
            old_name='kuyruk_seri_no',
            new_name='kuyruk_serial',
        ),
    ]
