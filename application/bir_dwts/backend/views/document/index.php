<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\DocumentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Documents';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button('Create Document', ['value'=>Url::to('/bir_dwts/backend/web/index.php?r=document%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Document</h4>',
                'id'=>'modal',
                'size'=>'modal-lg',
            ]);

        echo "<div id='modalContent'></div>";

        Modal::end()
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
         'rowOptions' => function($model){
                if($model->document_priority_id == '1')
                {
                    return ['class'=>'success'];
                }else if($model->document_priority_id == '2')
                {
                    return ['class'=>'warning'];
                }else if($model->document_priority_id == '3')
                {
                    return ['class'=>'danger'];
                }
        },
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'document_tracking_number',
            'document_name',
            'document_description',
            'document_target_date',
            // 'document_category',
            // 'document_priority_id',
            // 'document_type_id',
            // 'document_comment',
            // 'employee_id',
            // 'customer_id',
            // 'company_agency_id',
            // 'document_image_front_page',
            // 'create_time',
            // 'update_time',
            // 'section_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
