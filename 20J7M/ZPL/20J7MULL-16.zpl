set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.2162, <2> 45.1542, <3> 3.5099, <4> 49.8426, <5> 12.5629, <6> 0.1202, <7> 13.749, <8> 45.9564, <9> 38.8236, <10> 35.8271, <11> 25.1316, <12> 48.1559, <13> 28.1491, <14> 42.824, <15> 40.94, <16> 2.8784, <17> 30.4704, <18> 14.2524, <19> 7.6312, <20> 36.8459;
param workload[JOB] := <1> 1.2162, <2> 45.1542, <3> 3.5099, <4> 49.8426, <5> 12.5629, <6> 0.1202, <7> 13.749, <8> 45.9564, <9> 38.8236, <10> 35.8271, <11> 25.1316, <12> 48.1559, <13> 28.1491, <14> 42.824, <15> 40.94, <16> 2.8784, <17> 30.4704, <18> 14.2524, <19> 7.6312, <20> 36.8459;
param capacity[MACHINE] := <1> 74.863, <2> 74.863, <3> 74.863, <4> 74.863, <5> 74.863, <6> 74.863, <7> 74.863;

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
