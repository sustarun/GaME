# Generated by Django 2.1.2 on 2018-11-01 07:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='instance',
            name='year',
            field=models.IntegerField(default=2018),
            preserve_default=False,
        ),
    ]
