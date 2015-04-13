<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use dosamigos\datepicker\DatePicker;


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
        <?= Html::button('Create Document', ['value'=>Url::to('/bir_dwts/frontend/web/index.php?r=document%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
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
    <?php Pjax::begin(); ?>
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
            [
                'attribute' => 'document_target_date',
                'value' => 'document_target_date',
                'format' => 'raw',
                'filter' => DatePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'document_target_date', 
                    'clientOptions' => [
                        'autoclose' => true,
                        'format' => 'yyyy-mm-dd'
                    ]
                ]),

            ],
            [
                'attribute' => 'document_category',
                'value' => 'documentCategory.document_category_name',
            ],
            [
                'attribute' => 'document_priority_id',
                'value' => 'documentPriority.document_priority_name',
            ],
            [
                'attribute' => 'document_type_id',
                'value' => 'documentType.document_type_name',
            ],
            'document_comment',
            [
                'attribute' => 'employee_id',
                'value' => 'employee.employee_last_name',
            ],
            [
                'attribute' => 'customer_id',
                'value' => 'customer.customer_lastname',
            ],
            [
                'attribute' => 'company_agency_id',
                'value' => 'companyAgency.company_agency_code',
            ],
            //'document_image_front_page',
            'create_time',
            'update_time',
            [
                'attribute' => 'section_id',
                'value' => 'section.section_name',
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
