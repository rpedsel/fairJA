set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1519, <2> 19.7731, <3> 16.5192, <4> 31.7869, <5> 27.7289, <6> 26.8148, <7> 23.8985, <8> 23.9954, <9> 20.3598, <10> 19.5641, <11> 15.0125, <12> 16.2078, <13> 26.6077, <14> 23.4449, <15> 27.3919, <16> 25.637, <17> 22.6701, <18> 24.7357, <19> 28.082, <20> 22.4504;
param workload[JOB] := <1> 26.3389, <2> 36.5209, <3> 7.6911, <4> 5.9918, <5> 6.0723, <6> 30.4126, <7> 25.3896, <8> 4.2043, <9> 14.6009, <10> 1.1886, <11> 10.7275, <12> 33.1835, <13> 18.7121, <14> 11.8787, <15> 43.8709, <16> 27.4518, <17> 15.9908, <18> 6.9854, <19> 1.2238, <20> 27.4695;
param capacity[MACHINE] := <1> 59.3175, <2> 59.3175, <3> 59.3175, <4> 59.3175, <5> 59.3175, <6> 59.3175;

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
