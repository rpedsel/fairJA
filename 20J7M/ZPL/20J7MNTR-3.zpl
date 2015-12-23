set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9411, <2> 22.7284, <3> 29.2903, <4> 24.6207, <5> 26.3155, <6> 27.9522, <7> 23.911, <8> 26.7544, <9> 17.012, <10> 28.405, <11> 23.7415, <12> 27.1739, <13> 27.419, <14> 28.7777, <15> 18.0553, <16> 22.2293, <17> 25.0879, <18> 24.7239, <19> 27.5311, <20> 20.7821;
param workload[JOB] := <1> 28.629, <2> 20.0918, <3> 36.2913, <4> 43.6022, <5> 26.324, <6> 21.1564, <7> 14.3439, <8> 46.7812, <9> 18.1687, <10> 23.0805, <11> 45.1868, <12> 4.3685, <13> 1.3578, <14> 0.3448, <15> 31.5402, <16> 18.5049, <17> 15.6495, <18> 17.0136, <19> 25.7927, <20> 4.863;
param capacity[MACHINE] := <1> 47.474, <2> 47.474, <3> 47.474, <4> 47.474, <5> 47.474, <6> 47.474, <7> 47.474;

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
