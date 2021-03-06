set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4105, <2> 28.7144, <3> 7.1618, <4> 14.1827, <5> 46.1656, <6> 48.6736, <7> 45.4079, <8> 36.9545, <9> 37.1899, <10> 48.7995, <11> 34.9905, <12> 49.8736, <13> 10.7091, <14> 34.7532, <15> 14.3175, <16> 20.1237, <17> 42.4572, <18> 17.9154, <19> 3.2512, <20> 13.2323;
param workload[JOB] := <1> 23.6028, <2> 7.2063, <3> 12.9099, <4> 18.3477, <5> 23.3841, <6> 34.7325, <7> 6.1625, <8> 15.9309, <9> 25.1514, <10> 4.963, <11> 14.486, <12> 34.0135, <13> 17.412, <14> 42.8192, <15> 9.2526, <16> 21.867, <17> 36.8265, <18> 28.6466, <19> 0.616, <20> 5.669;
param capacity[MACHINE] := <1> 383.9995, <2> 383.9995, <3> 383.9995, <4> 383.9995, <5> 383.9995, <6> 383.9995, <7> 383.9995;

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
