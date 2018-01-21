<?php

namespace app\controllers;

use app\models\Autors;
use app\models\BooksHasAutor;
use Yii;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\Books;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {

        $top = Autors::find()
            ->select(['b.id'])
            ->distinct()
            ->innerJoin(BooksHasAutor::tableName() . ' bha', Autors::tableName() .'.id = bha.autor_id')
            ->innerJoin(Books::tableName() . ' b', 'bha.book_id = b.id')
            ->groupBy(['b.dt', Autors::tableName().'.id'])
            ->orderBy(['COUNT(b.id)' => SORT_DESC])
            ->limit(10)
            ->all();

        $top = ArrayHelper::map($top, 'id', 'id');

        $books = Books::find()
            ->with('image', 'booksHasAutors')
            ->where(['in', 'id', $top])
            ->orderBy([new \yii\db\Expression('FIELD (id, ' . implode(',', $top) . ')')])
            ->all();

        return $this->render('index', [
            'books' => $books,
        ]);
    }


    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
