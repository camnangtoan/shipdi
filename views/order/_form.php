<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Statusorder;
use app\models\Formlevy;
use app\models\Weight;
use app\models\Size;
use app\models\Timeorder;
use app\models\Shop;
use app\models\Charge;
use app\models\Statuscod;
/* @var $this yii\web\View */
/* @var $model app\models\Order */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="order-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'phonenumber')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <input type="button" value="<?= Yii::t('app','Search address')?>" id="btn" onClick="showMap();"/>
    <div id="map"></div>
    <?= $form->field($model, 'locationx')->textInput(['maxlength' => true,'type'=>'hidden'])->label(FALSE)?>

    <?= $form->field($model, 'locationy')->textInput(['maxlength' => true,'type'=>'hidden'])->label(FALSE) ?>
    
    <?= $form->field($model, 'charges_id')->dropDownList(ArrayHelper::map(Charge::find()->select(['type','content','id'])->all(), 'id', 'content'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'shop_id')->dropDownList(ArrayHelper::map(Shop::find()->select(['name','address','id'])->all(), 'id', 'name'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'weight_id')->dropDownList(ArrayHelper::map(Weight::find()->select(['type','content','id'])->all(), 'id', 'content'),['class' => 'form-control inline-block']); ?>

    <?= $form->field($model, 'size_id')->dropDownList(ArrayHelper::map(Size::find()->select(['type','width','height','length','id'])->all(), 'id', 'type'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'timeorder_id')->dropDownList(ArrayHelper::map(Timeorder::find()->select(['type','content','id'])->all(), 'id', 'type'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'levy_id')->dropDownList(ArrayHelper::map(Formlevy::find()->select(['type','content','id'])->all(), 'id', 'type'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'statusorder_id')->dropDownList(ArrayHelper::map(Statusorder::find()->select(['type','content','id'])->all(), 'id', 'type'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'cod_id')->dropDownList(ArrayHelper::map(Statuscod::find()->select(['type','content','id'])->all(), 'id', 'type'),['class' => 'form-control inline-block']); ?>
    
    <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>
    
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
