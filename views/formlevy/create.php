<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Formlevy */

$this->title = Yii::t('app', 'Create Formlevy');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Formlevies'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="formlevy-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
