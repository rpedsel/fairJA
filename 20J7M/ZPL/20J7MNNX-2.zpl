set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.043, <2> 25.1596, <3> 23.9575, <4> 21.2692, <5> 29.7096, <6> 29.0839, <7> 21.1866, <8> 18.3654, <9> 30.5406, <10> 24.0755, <11> 38.6222, <12> 24.219, <13> 19.5994, <14> 22.1591, <15> 34.1131, <16> 28.6131, <17> 15.7187, <18> 26.062, <19> 20.0997, <20> 23.6028;
param workload[JOB] := <1> 5.6607, <2> 5.0159, <3> 4.8946, <4> 4.6119, <5> 5.4507, <6> 5.3929, <7> 4.6029, <8> 4.2855, <9> 5.5264, <10> 4.9067, <11> 6.2147, <12> 4.9213, <13> 4.4271, <14> 4.7073, <15> 5.8406, <16> 5.3491, <17> 3.9647, <18> 5.1051, <19> 4.4833, <20> 4.8583;
param capacity[MACHINE] := <1> 100.2197, <2> 100.2197, <3> 100.2197, <4> 100.2197, <5> 100.2197, <6> 100.2197, <7> 100.2197;

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
