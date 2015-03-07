<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\documentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Documents';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Document', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'create_time',
            'update_time',
            'encoded_by',
            'customer_id',
            // 'company_agency_id',
            // 'document_tracking_number',
            // 'document_description',
            // 'document_priority',
            // 'document_category',
            // 'document_type',
            // 'document_notes',
            // 'document_image_front_page',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
