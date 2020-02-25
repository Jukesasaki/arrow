from django import forms

AGE_CHOICES = (
    ('20', '20代'),
    ('30', '30代'),
    ('40', '40代'),
    ('50', '50代'),
    ('60', '60代')
)

SEX_CHOICES = (
    ('1', '男'),
    ('2', '女')
)
EMO_CHOICES = (
    ('1', '理性的'),
    ('2', '感情的')
)
OD_CHOICES = (
    ('1', '攻め手'),
    ('2', '受け手')
)
INTENTION_CHOICES = (
    ('1', '上昇志向'),
    ('2', '安定志向')
)
PERSONALITY_CHOICES = (
    ('1', '個性的'),
    ('2', '協調的')
)
ACT_CHOICES = (
    ('1', '行動的'),
    ('2', '慎重的')
)
LEVEL_CHOICES = (
    ('0', '管理者'),
    ('1', '一般')
)


class CheckForm(forms.Form):
    age = forms.ChoiceField(
        label='年齢',
        widget=forms.Select(attrs={'class': 'add_color'}),
        choices=AGE_CHOICES,
        required=True,
        label_suffix='',
    )

    sex = forms.ChoiceField(
        label='性別',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=SEX_CHOICES,
        required=True,
        label_suffix='',
    )

    emo = forms.ChoiceField(
        label='情緒',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=EMO_CHOICES,
        required=True,
        label_suffix='',
    )

    od = forms.ChoiceField(
        label='属性',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=OD_CHOICES,
        required=True,
        label_suffix='',
    )

    intention = forms.ChoiceField(
        label='志向',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=INTENTION_CHOICES,
        required=True,
        label_suffix='',
    )

    personality = forms.ChoiceField(
        label='人格',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=PERSONALITY_CHOICES,
        required=True,
        label_suffix='',
    )

    act = forms.ChoiceField(
        label='行動',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=ACT_CHOICES,
        required=True,
        label_suffix='',
    )


class CreateUserForm(forms.Form):
    name = forms.CharField(
        label='ユーザID',
        widget=forms.TextInput(attrs={'class': 'add_color'}),
        min_length='4',
        max_length='8',
        help_text='半角英数字4~8文字',
        required=True,
        label_suffix='',
    )

    password = forms.CharField(
        label='パスワード',
        widget=forms.PasswordInput(attrs={'class': 'add_color'}),
        min_length='4',
        max_length='8',
        help_text='半角英数字4~8文字',
        required=True,
        label_suffix='',
    )

    password2 = forms.CharField(
        label='パスワード（確認）',
        widget=forms.PasswordInput(attrs={'class': 'add_color'}),
        min_length='4',
        max_length='8',
        help_text='半角英数字4~8文字',
        required=True,
        label_suffix='',
    )

    level = forms.ChoiceField(
        label='権限',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=LEVEL_CHOICES,
        required=True,
        label_suffix='',
    )


class UpdateUserForm(forms.Form):
    password = forms.CharField(
        label='パスワード',
        widget=forms.PasswordInput(attrs={'class': 'add_color'}),
        min_length='4',
        max_length='8',
        help_text='半角英数字4~8文字',
        required=True,
        label_suffix='',
    )

    password2 = forms.CharField(
        label='パスワード（確認）',
        widget=forms.PasswordInput(attrs={'class': 'add_color'}),
        min_length='4',
        max_length='8',
        help_text='半角英数字4~8文字',
        required=True,
        label_suffix='',
    )

    level = forms.ChoiceField(
        label='権限',
        widget=forms.RadioSelect(attrs={'class': 'add_color'}),
        choices=LEVEL_CHOICES,
        required=True,
        label_suffix='',
    )
