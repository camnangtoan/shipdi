<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Statusorder */

$this->title = Yii::t('app', 'Create Status order');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Status orders'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="statusorder-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
