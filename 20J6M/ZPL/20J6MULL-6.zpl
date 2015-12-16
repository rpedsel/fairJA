set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.6119, <2> 47.7064, <3> 27.6933, <4> 2.4166, <5> 42.1591, <6> 29.8965, <7> 26.3011, <8> 38.0313, <9> 47.8949, <10> 43.7774, <11> 42.7693, <12> 19.0511, <13> 21.581, <14> 49.7554, <15> 30.7548, <16> 12.5081, <17> 31.4113, <18> 3.4294, <19> 49.9119, <20> 49.0122;
param workload[JOB] := <1> 1.6119, <2> 47.7064, <3> 27.6933, <4> 2.4166, <5> 42.1591, <6> 29.8965, <7> 26.3011, <8> 38.0313, <9> 47.8949, <10> 43.7774, <11> 42.7693, <12> 19.0511, <13> 21.581, <14> 49.7554, <15> 30.7548, <16> 12.5081, <17> 31.4113, <18> 3.4294, <19> 49.9119, <20> 49.0122;
param capacity[MACHINE] := <1> 102.9455, <2> 102.9455, <3> 102.9455, <4> 102.9455, <5> 102.9455, <6> 102.9455;

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
