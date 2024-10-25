# Generated by Django 3.2.25 on 2024-10-23 13:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aircraft_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Kanat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ucak_adi', models.CharField(choices=[('TB2', 'TB2'), ('TB3', 'TB3'), ('Akıncı', 'Akıncı'), ('Kızılelma', 'Kızılelma')], max_length=50)),
                ('kanat_seri_numarasi', models.CharField(blank=True, max_length=100)),
            ],
        ),
    ]