<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
    <?php $this->beginBody() ?>
    <div class="wrap">
        <?php
            NavBar::begin([
                'brandLabel' => 'BIR DWTS',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            $menuItems = [
                ['label' => 'Home', 'visible' => !Yii::$app->user->isGuest, 'url' => ['/site/index']],
            ];

            $menuItems[]=['label' => 'Document',
               'visible' => !Yii::$app->user->isGuest,
                'items' => [
                    ['label' => 'My Document', 'url' => ['/document']],
                    ['label' => 'Document Workflow', 'url' => ['/document-workflow']],
                    ['label' => 'Company Agencies', 'url' => ['/company-agency']],
                    ['label' => 'Customers', 'url' => ['/customer']],
                ],

            ];

            $menuItems[]=['label' => 'Employees',
                'visible' => !Yii::$app->user->isGuest,
                'items' => [
                    ['label' => 'Employee', 'url' => ['/employee']],
                    ['label' => 'Employee Has Position', 'url' => ['/employee-has-position']],
                    ['label' => 'User', 'url' => ['/user']],
                ],

            ];

            $menuItems[]=['label' => 'Station',
                'visible' => !Yii::$app->user->isGuest,
                'items' => [
                    ['label' => 'Station Desk', 'url' => ['/station-desk']],
                    ['label' => 'Station Desk Role', 'url' => ['/station-desk-role']],
                ],

            ];

            $menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];

            $menuItems[]=['label' => 'Admin',
                'visible' => !Yii::$app->user->isGuest,
                'items' => [
                    ['label' => 'Document Category', 'url' => ['/document-category']],
                    ['label' => 'Document Priority', 'url' => ['/document-priority']],
                    ['label' => 'Document Type', 'url' => ['/document-type']],
                    ['label' => 'Document Work Flow Status', 'url' => ['/document-workflow-status']],
                    ['label' => 'Section', 'url' => ['/section']],
                    ['label' => 'Position', 'url' => ['/position']],
                ],

            ];



            if (Yii::$app->user->isGuest) {
                $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
            } else {
                $menuItems[] = [
                    'label' => 'Logout (' . Yii::$app->user->identity->username . ')',
                    'url' => ['/site/logout'],
                    'linkOptions' => ['data-method' => 'post']
                ];
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
        ?>

        <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
        <p class="pull-left">&copy; BIR <?= date('Y') ?></p>
        <p class="pull-right"><?= Yii::powered() ?></p>
        </div>
    </footer>

    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
