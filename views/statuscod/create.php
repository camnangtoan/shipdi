<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Statuscod */

$this->title = Yii::t('app', 'Create Statuscod');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Statuscods'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="statuscod-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
