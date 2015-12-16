set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1633, <2> 17.4139, <3> 20.5109, <4> 28.3922, <5> 24.1652, <6> 20.1756, <7> 26.3791, <8> 29.0481, <9> 25.2667, <10> 23.0945, <11> 31.4556, <12> 17.7933, <13> 23.9131, <14> 22.902, <15> 27.8448, <16> 27.6932, <17> 26.0956, <18> 17.2223, <19> 19.0382, <20> 29.0127;
param workload[JOB] := <1> 4.9156, <2> 4.173, <3> 4.5289, <4> 5.3284, <5> 4.9158, <6> 4.4917, <7> 5.1361, <8> 5.3896, <9> 5.0266, <10> 4.8057, <11> 5.6085, <12> 4.2182, <13> 4.8901, <14> 4.7856, <15> 5.2768, <16> 5.2624, <17> 5.1084, <18> 4.15, <19> 4.3633, <20> 5.3863;
param capacity[MACHINE] := <1> 16.2935, <2> 16.2935, <3> 16.2935, <4> 16.2935, <5> 16.2935, <6> 16.2935;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
