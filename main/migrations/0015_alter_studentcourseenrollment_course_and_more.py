# Generated by Django 4.1.5 on 2023-01-21 17:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0014_alter_student_email_alter_student_fullname'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentcourseenrollment',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.course'),
        ),
        migrations.AlterField(
            model_name='studentcourseenrollment',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.student'),
        ),
    ]
