set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6414, <2> 15.3699, <3> 36.9194, <4> 30.5829, <5> 48.7072, <6> 20.1234, <7> 26.4019, <8> 41.3472, <9> 44.6514, <10> 8.5455, <11> 5.4125, <12> 41.6264, <13> 11.7749, <14> 16.8833, <15> 37.1798, <16> 10.8957, <17> 3.0343, <18> 40.1633, <19> 18.2386, <20> 5.5381;
param workload[JOB] := <1> 27.6414, <2> 15.3699, <3> 36.9194, <4> 30.5829, <5> 48.7072, <6> 20.1234, <7> 26.4019, <8> 41.3472, <9> 44.6514, <10> 8.5455, <11> 5.4125, <12> 41.6264, <13> 11.7749, <14> 16.8833, <15> 37.1798, <16> 10.8957, <17> 3.0343, <18> 40.1633, <19> 18.2386, <20> 5.5381;
param capacity[MACHINE] := <1> 81.8395, <2> 81.8395, <3> 81.8395, <4> 81.8395, <5> 81.8395, <6> 81.8395;

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
