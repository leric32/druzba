from django.contrib.auth.models import AbstractUser
from django.db import models


class Activity(models.Model):
    ida = models.AutoField(db_column='idA', primary_key=True)  # Field name made lowercase.
    title = models.CharField(max_length=45, blank=True, null=True)
    desc = models.CharField(max_length=300, blank=True, null=True)
    meetingpoint = models.CharField(db_column='meetingPoint', max_length=45, blank=True, null=True)  # Field name made lowercase.
    start_time = models.DateTimeField(blank=True, null=True)
    duration = models.IntegerField(blank=True, null=True)
    maxpeople = models.IntegerField(db_column='maxPeople', blank=True, null=True)  # Field name made lowercase.
    minpeople = models.IntegerField(db_column='minPeople', blank=True, null=True)  # Field name made lowercase.
    idt = models.ForeignKey('Type', models.DO_NOTHING, db_column='idT', blank=True, null=True)  # Field name made lowercase.
    idu = models.ForeignKey('Users', models.DO_NOTHING, db_column='idU', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'activity'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class Comment(models.Model):
    idc = models.AutoField(db_column='idC', primary_key=True)  # Field name made lowercase.
    desc = models.CharField(max_length=300, blank=True, null=True)
    ida = models.ForeignKey(Activity, models.DO_NOTHING, db_column='idA', blank=True, null=True)  # Field name made lowercase.
    idu = models.ForeignKey('Users', models.DO_NOTHING, db_column='idU', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'comment'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Type(models.Model):
    idt = models.AutoField(db_column='idT', primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'type'


class UserActivity(models.Model):
    idua = models.AutoField(db_column='idUA', primary_key=True)  # Field name made lowercase.
    ida = models.ForeignKey('Activity', models.DO_NOTHING, db_column='idA', blank=True, null=True)  # Field name made lowercase.
    idu = models.ForeignKey('Users', models.DO_NOTHING, db_column='idU', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'user_activity'


class Users(AbstractUser):
    idu = models.AutoField(db_column='idU', primary_key=True)  # Field name made lowercase.
    image = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        db_table = 'users'


class UsersGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    users = models.ForeignKey(Users, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_groups'
        unique_together = (('users', 'group'),)


class UsersUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    users = models.ForeignKey(Users, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_user_permissions'
        unique_together = (('users', 'permission'),)