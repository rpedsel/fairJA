set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.8117, <2> 25.4309, <3> 5.0332, <4> 33.506, <5> 9.4371, <6> 4.7473, <7> 9.4177, <8> 30.8519, <9> 15.2547, <10> 34.0001, <11> 39.9882, <12> 13.234, <13> 39.5989, <14> 29.8014, <15> 46.0422, <16> 21.9466, <17> 43.7781, <18> 49.2258, <19> 42.9202, <20> 44.9383;
param workload[JOB] := <1> 31.8117, <2> 25.4309, <3> 5.0332, <4> 33.506, <5> 9.4371, <6> 4.7473, <7> 9.4177, <8> 30.8519, <9> 15.2547, <10> 34.0001, <11> 39.9882, <12> 13.234, <13> 39.5989, <14> 29.8014, <15> 46.0422, <16> 21.9466, <17> 43.7781, <18> 49.2258, <19> 42.9202, <20> 44.9383;
param capacity[MACHINE] := <1> 71.3705, <2> 71.3705, <3> 71.3705, <4> 71.3705, <5> 71.3705, <6> 71.3705;

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
