<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Charge */

$this->title = Yii::t('app', 'Create Charge');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Charges'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="charge-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
