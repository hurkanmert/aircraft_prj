# Generated by Django 3.2.25 on 2024-10-24 17:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('aircraft_app', '0006_auto_20241024_1628'),
    ]

    operations = [
        migrations.CreateModel(
            name='Ucak',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ucak_adi', models.CharField(max_length=100)),
                ('seri_numarasi', models.CharField(max_length=50)),
                ('uretim_tarihi', models.DateTimeField(auto_now_add=True)),
                ('aviyonik_seri_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aircraft_app.aviyonik')),
                ('govde_seri_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aircraft_app.govde')),
                ('kanat_seri_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aircraft_app.kanat')),
                ('kuyruk_seri_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aircraft_app.kuyruk')),
            ],
        ),
    ]
