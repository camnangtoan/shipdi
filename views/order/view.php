<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Order */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Orders'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<div class="order-view">

    <h1><?= Html::encode($this->title) ?></h1>
    
    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'phonenumber',
            'address',
            'locationx',
            'locationy',
            'charges_id',
            'shop_id',
            'weight_id',
            'size_id',
            'timeorder_id:datetime',
            'levy_id',
            'statusorder_id',
           // 'statusCOD',
            'note:ntext',
        ],
    ]) ?>

</div>
<input  id="pac-input" class="controls" type="hidden" placeholder="Search Box">
<div    id="map-canvas" ></div>
<input id="order-address" value="<?= $model->address?>" type="hidden">
<input id="order-locationx" value="<?= $model->locationx?>" type="hidden">
<input id="order-locationy" value="<?= $model->locationy?>" type="hidden">

<script src="../js/map.js"></script>