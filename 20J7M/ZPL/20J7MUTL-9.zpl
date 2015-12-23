set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.0659, <2> 0.9148, <3> 44.7086, <4> 12.5456, <5> 1.3527, <6> 20.0398, <7> 24.2401, <8> 9.6946, <9> 43.3439, <10> 8.1005, <11> 9.6677, <12> 26.3992, <13> 46.3716, <14> 24.0585, <15> 22.4447, <16> 21.0878, <17> 25.2733, <18> 36.9348, <19> 34.8519, <20> 19.1196;
param workload[JOB] := <1> 12.0659, <2> 0.9148, <3> 44.7086, <4> 12.5456, <5> 1.3527, <6> 20.0398, <7> 24.2401, <8> 9.6946, <9> 43.3439, <10> 8.1005, <11> 9.6677, <12> 26.3992, <13> 46.3716, <14> 24.0585, <15> 22.4447, <16> 21.0878, <17> 25.2733, <18> 36.9348, <19> 34.8519, <20> 19.1196;
param capacity[MACHINE] := <1> 47.4874, <2> 47.4874, <3> 47.4874, <4> 47.4874, <5> 47.4874, <6> 47.4874, <7> 47.4874;

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
